$(document).ready(function () {
    $("#submitfb").click(function () {
        var feedback = $("#fb").val();
        var email = $("#emailfb").val();

        if (feedback === "" || email === "") {
            alert("Please fill in all the fields to continue...");
        } else {
            alert("submitting.....");
//            $.post("feedbackform", {feedback1: feedback, email1: email},
//            function () {
////                if (data == 'Your Feedback has been submitted!') {
////                $("form")[1].reset(); // not the first form.. the second.. so index is 1.
//                              alert("Your Feedback has been submitted!");
//
//                $("#feedbackForm").reset(); 
////                }
//            });
            var dataString = "feedback1=" + feedback + "&email1=" + email;
            $.ajax({
                type: "POST",
                url: "feedBform",
                data: dataString,
                success: function (data) {
                    $("#feedbackForm").reset();
                }
            });
        }//-----end if-else
    });
});

//$(function () {
//
//    // Setup form validation on the #register-form element
//    $("#feedbackForm").validate({
//        // Specify the validation rules
//        rules: {
//            fb: "required",
//            emailfb: {
//                required: true,
//                email: true
//            }
//        },
//        // Specify the validation error messages
//        messages: {
//            fb: "Please enter feedback",
//            emailfb: "Please enter your valid email address"
//        },
//        submitHandler: function (form) {
//            form.submit();
//        }
//    });
//
//});