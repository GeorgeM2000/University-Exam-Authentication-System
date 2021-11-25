$(document).ready(function() {
    $("#id_verification_button").click(function() {
        $.post(
            "/id_verification",
            function(data){
                $("#name").text(data[0].s_name);
                $("#surname").text(data[0].surname);
                $("#am").text(data[0].am);
                $("#email").text(data[0].academic_email);
                $("#phone").text(data[0].phone);
                $("#year").text(data[0].s_year);
                $("#department").text(data[0].department);
        });
    });
});

