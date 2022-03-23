<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header"> Create Answer </div>
                    <div class="card-body">
                        <form method="POST" action="" @submit.prevent="createAnswer">
                            <div class="row mb-3">
                                <label for="name" class="col-md-3 col-form-label text-md-end">
                                    Select Question
                                </label>
                                <div class="col-md-8">
                                    <select id="question" v-model="form.question_id" class="form-control" name="question">
                                        <option :value="''" selected>Select Question</option>
                                        <template v-for="(question, index) in questions">
                                            <option :value="question.id"> {{ question.title }} </option>
                                        </template>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="answer_title" class="col-md-3 col-form-label text-md-end">
                                    Answer Title
                                </label>
                                <div class="col-md-8">
                                    <input type="text" v-model="form.title" id="answer_title" class="form-control" name="answer_title" required autocomplete="answer_title">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-md-3 col-form-label text-md-end">
                                    Is Right Answer?
                                </label>
                                <div class="col-md-8">
                                    <label class="col-form-label text-md-end me-3">
                                        <input type="radio" v-model="form.is_right" name="right_answer" value="no" checked> NO
                                    </label>
                                    <label class="col-form-label text-md-end">
                                        <input type="radio" v-model="form.is_right" name="right_answer" value="yes"> Yes
                                    </label>
                                </div>
                            </div>
                            <div class="row mb-0">
                                <div class="col-md-7 offset-md-3">
                                    <button @click.prevent="createAnswer" type="submit" class="btn btn-primary d-flex justify-content-center align-items-center" :disabled="submitFlag">
                                        Create Answer
                                        <div v-if="submitFlag" class="spinner-border spinner-border-sm ms-3" role="status">
                                            <span class="sr-only"></span>
                                        </div>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Answer",
        data() {
            return {
                form: {
                    question_id: "",
                    title: "",
                    is_right: "no",
                },
                questions: {},
                submitFlag: false,
            }
        },
        mounted() {
            this.getQuestion();
        },
        methods: {
            getQuestion(){
                this.submitFlag = true;
                axios.get(`${MAIN_URL}/question`)
                    .then((response)=>{
                        if(response.data.code == 0){
                            this.questions = response.data.data;
                            this.submitFlag = false;
                        }
                    })
                    .catch((xhr)=>{
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });
            },
            createAnswer(){
                if(this.form.question_id == ""){
                    this.$swal("Error", 'Question must be required', "error");
                    return true;
                }
                if(this.form.title == ""){
                    this.$swal("Error", 'Answer Title must be required', "error");
                    return true;
                }
                if(this.form.is_right == ""){
                    this.$swal("Error", 'Is-Right must be required', "error");
                    return true;
                }
                if(this.submitFlag == true){
                    return true;
                }
                this.submitFlag = true;
                let data = {
                    question_id: this.form.question_id,
                    title: this.form.title,
                    is_right: this.form.is_right,
                };
                axios.post(`${MAIN_URL}/answer`, data)
                    .then((response)=>{
                        if(response.data.code == 0){
                            this.$swal("Success",response.data.data,"success");
                            this.submitFlag = false;
                            this.form.title = "";
                        }
                    })
                    .catch((xhr)=>{
                        this.submitFlag = false;
                        this.$swal("Error", `${xhr.status}: ${xhr.statusText}`, "error");
                    });
            }
        }
    }
</script>

<style scoped>

</style>
