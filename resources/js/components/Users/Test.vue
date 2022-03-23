<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <template v-if="form.question_no <= 9">
                    <div class="card">
                        <div class="card-header"> Start Test </div>
                        <div class="card-body">

                            <template v-if="form.user_id">

                                <div class="row mb-3">
                                    <div class="col-md-12">
                                        <h4>
                                            {{ form.question_no+1 }}: {{ questions.title }}
                                        </h4>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <template v-for="(answer, ansIndex) in questions.answers">
                                        <div class="col-md-12">
                                            <label class="col-form-label text-md-end me-3">
                                                <input type="radio" v-model="form.answer" name="right_answer" :value="answer.id" checked> {{ answer.title }}
                                            </label>
                                        </div>
                                    </template>
                                </div>

                                <div class="row mb-0">
                                    <div class="col-md-12">
                                        <div class="d-flex justify-content-start align-items-center">
                                            <button @click.prevent="skipAnswer(questions.id)" type="submit" class="btn btn-secondary d-flex justify-content-center align-items-center" :disabled="submitFlag">
                                                Skip
                                            </button>
                                            <button @click.prevent="submitAnswer(questions.id)" type="submit" class="btn btn-primary d-flex justify-content-center align-items-center ms-3" :disabled="submitFlag">
                                                Next
                                            </button>
                                            <div v-if="submitFlag" class="spinner-border spinner-border-sm ms-3" role="status">
                                                <span class="sr-only"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </template>

                            <template v-else>
                                <div class="row mb-3">
                                    <label for="answer_title" class="col-md-3 col-form-label text-md-end">
                                        Enter Your Name
                                    </label>
                                    <div class="col-md-8">
                                        <input type="text" v-model="form.user_name" id="answer_title" class="form-control" name="answer_title" required autocomplete="answer_title" placeholder="Enter Your Name">
                                    </div>
                                </div>
                                <div class="row mb-0">
                                    <div class="col-md-7 offset-md-3">
                                        <button @click.prevent="startTest" type="button" class="btn btn-primary d-flex justify-content-center align-items-center" :disabled="submitFlag">
                                            Next
                                            <div v-if="submitFlag" class="spinner-border spinner-border-sm ms-3" role="status">
                                                <span class="sr-only"></span>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </template>

                        </div>
                    </div>
                </template>
                <template v-else>
                    <div class="card">
                        <div class="card-header"> Result Page </div>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <ul class="list-group">
                                        <li class="list-group-item">
                                            <b> Correct Answers: </b> {{ answers.correctAnswers }}
                                        </li>
                                        <li class="list-group-item">
                                            <b> Wrong Answers: </b> {{ answers.wrongAnswers }}
                                        </li>
                                        <li class="list-group-item">
                                            <b> Skip Answers: </b> {{ answers.skipAnswers }}
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Test",
        data() {
            return {
                form: {
                    user_id: "",
                    user_name: "",
                    answer: "",
                    question_no: 0,
                },
                answers: {
                    correctAnswers: "",
                    wrongAnswers: "",
                    skipAnswers: "",
                },
                questions: {},
                submitFlag: false,
            }
        },
        mounted() {
            this.getQuestionForTest();
        },
        methods: {
            getQuestionForTest(){
                this.submitFlag = true;
                axios.post(`${MAIN_URL}/question-test`,{
                    'limit': 1,
                    'id': this.form.question_no,
                })
                    .then((response)=>{
                        if(response.data.code == 0){
                            this.questions = response.data.data[0];
                            this.submitFlag = false;
                        }
                    })
                    .catch((xhr)=>{
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });
            },
            submitAnswer(questionId){
                if(this.form.user_id == ""){
                    this.$swal("Error", 'User ID must be required', "error");
                    return true;
                }
                if(this.form.answer == ""){
                    this.$swal("Error", 'Choose at least one option', "error");
                    return true;
                }
                if(this.submitFlag == true){
                    return true;
                }
                this.submitFlag = true;
                let data = {
                    user_id: this.form.user_id,
                    answer_id: this.form.answer,
                    question_id: questionId,
                    question_no: this.form.question_no,
                    attend_type: "answer",
                };
                    axios.post(`${MAIN_URL}/test`, data)
                    .then((response)=>{
                        if(response.data.code == 0){
                            this.form.answer = "";
                            this.form.question_no++;
                            this.submitFlag = false;
                            if(this.form.question_no <= 9) {
                                this.getQuestionForTest();
                            } else {
                                this.getUserResult();
                            }
                        }
                    })
                    .catch((xhr)=>{
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });

            },
            skipAnswer(questionId) {
                if(this.form.user_id == ""){
                    this.$swal("Error", 'User ID must be required', "error");
                    return true;
                }
                if(this.submitFlag == true){
                    return true;
                }
                this.submitFlag = true;
                let data = {
                    user_id: this.form.user_id,
                    answer_id: 0,
                    question_id: questionId,
                    question_no: this.form.question_no,
                    attend_type: "skip",
                };
                axios.post(`${MAIN_URL}/test`, data)
                    .then((response) => {
                        if (response.data.code == 0) {
                            this.form.answer = "";
                            this.form.question_no++;
                            this.submitFlag = false;
                            if(this.form.question_no <= 9) {
                                this.getQuestionForTest();
                            } else {
                                this.getUserResult();
                            }
                        }
                    })
                    .catch((xhr) => {
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });
            },
            startTest(){
                if(this.form.user_name == ""){
                    this.$swal("Error", 'Your Name must be required', "error");
                    return true;
                }
                if(this.submitFlag == true){
                    return true;
                }
                this.submitFlag = true;
                let data = {
                    name: this.form.user_name,
                };
                axios.post(`${MAIN_URL}/user`, data)
                    .then((response)=>{
                        if(response.data.code == 0){
                            this.form.user_id = response.data.data.id;
                            this.submitFlag = false;
                        } else {
                            this.$swal("Error", "Your name does not saved. please try again.", "error");
                            this.submitFlag = false;
                        }
                    })
                    .catch((xhr)=>{
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });
            },
            getUserResult(){
                let userResultData = {
                    user_id: this.form.user_id,
                };
                axios.post(`${MAIN_URL}/get-user-result`, userResultData)
                    .then((response) => {
                        if (response.data.code == 0) {
                            this.answers.correctAnswers = response.data.data.correctAnswers;
                            this.answers.wrongAnswers = response.data.data.wrongAnswers;
                            this.answers.skipAnswers = response.data.data.skipAnswers;
                            this.submitFlag = false;
                        }
                    })
                    .catch((xhr) => {
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });
            },
        }
    }
</script>

<style scoped>

</style>
