<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header"> Create Question </div>
                    <div class="card-body">
                        <form method="POST" action="" @submit.prevent="createQuestion">
                            <div class="row mb-3">
                                <label for="name" class="col-md-3 col-form-label text-md-end">
                                    Question Title
                                </label>
                                <div class="col-md-8">
                                    <input id="name" type="text" class="form-control" name="name" required autocomplete="name" v-model="form.title" autofocus>
                                </div>
                            </div>
                            <div class="row mb-0">
                                <div class="col-md-7 offset-md-3">
                                    <button @click.prevent="createQuestion" type="submit" class="btn btn-primary d-flex justify-content-center align-items-center" :disabled="submitFlag">
                                        Create Question
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
        name: "Question",
        data() {
            return {
                form: {
                    title: "",
                },
                submitFlag: false,
            }
        },
        mounted() {
        },
        methods: {
            createQuestion(){
                if(this.form.title == ""){
                    this.$swal("Error", 'Question Title must be required', "error");
                    return true;
                }
                if(this.submitFlag == true){
                    return true;
                }
                this.submitFlag = true;
                let data = {
                    title: this.form.title,
                };
                axios.post(`${MAIN_URL}/question`, data)
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
