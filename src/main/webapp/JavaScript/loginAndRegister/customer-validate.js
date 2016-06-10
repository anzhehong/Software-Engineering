
jQuery(function($){

    $(document).ready(function(){

        $("#userLogin").validate({
            rules:{
                userId:{
                    required:true,
                    rangelength:[7,7],
                    remote: {
                        type:"POST",
                        url: "/camplus/user/checkUserIdExist",
                        data: {
                            userId: function() {
                                return $("#userId").val();
                            }
                        }
                    }
                },
                userPassword:{
                    required:true,
                    remote: {
                        type:"POST",
                        url: "/camplus/user/checkUserPassword",
                        data: {
                            userPassword: function() {
                                return $("#userPassword").val();

                            },
                            userId: function() {
                                return $("#userId").val();
                            }
                        }
                    }
                }
            },
            messages:{
                userId:{
                    required:"请填写学号",
                    rangelength:"必须是七位数字",
                    remote:"用户名不存在"
                },
                userPassword:{
                    required:"还没输密码呢亲╭(╯3╰)╮",
                    remote:"密码不正确"
                }
            }
        });

        $("#selfInfoChangeForm").validate({
            rules:{
                password:{
                    required:true,
                    minlength:5,
                    maxlength:13
                },
                repassword:{
                    required:true,
                    minlength:5,
                    equalTo:"#password",
                    maxlength:13
                },
                uname:{
                    required:true
                },
                contact:{
                    required:true
                }
            },
            messages:{

                password:{
                    required:"密码也不填啊亲╭(╯3╰)╮",
                    minlength:"密码不能少于5位",
                    maxlength:"密码不能多于12位啊!"
                },
                repassword:{
                    required:"记得要验证密码啊╭(╯3╰)╮",
                    minlength:"确认密码不能少于5喂",
                    equalTo: "两次输入密码不一致",
                    maxlength:"密码不能多于12位啊!"
                },
                uname:{
                    required:"请输入姓名！"
                },
                contact:{
                    required:"联系方式不能少啊"
                }
            }
        });

        $("#userRegister").validate({
            rules:{
                userId:{
                    required:true,
                    number:true,
                    rangelength:[7,7],
                    remote: {
                        type: "POST",
                        url: "/camplus/checkUserIdExist",
                        data: {
                            userId: function () {
                                return $("#userId").val();
                            }
                        }
                    }
                },
                userPassword:{
                    required:true,
                    rangelength:[6,12]
                },
                userPasswordAgain:{
                    required:true,
                    rangelength:[6,12],
                    equalTo:"#userPassword"
                },
                userName:{
                    required:true
                }
            },
            messages:{
                userId:{
                    required:"学生号不能少啊亲╭(╯3╰)╮",
                    number:"学号必须是数字啊亲╭(╯3╰)╮",
                    rangelength:"学号只能是7位啊╭(╯3╰)╮",
                    remote:"该用户名已经存在"
                },
                userPassword:{
                    required:"密码也不填啊亲╭(╯3╰)╮",
                    rangelength:"密码不能少于5位,不能多于12位"
                },
                userPasswordAgain:{
                    required:"记得要验证密码啊╭(╯3╰)╮",
                    rangelength:"确认密码不能少于5位,不能多于12位",
                    equalTo: "两次输入密码不一致"
                },
                userName:{
                    required:"亲，告诉我们你叫什么名字呀！"
                }
            }
        });


    });
});
