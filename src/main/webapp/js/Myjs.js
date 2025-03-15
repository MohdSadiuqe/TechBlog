function doLike(pid, uid) {
    console.log("Post ID:", pid, "User ID:", uid); // Debugging

    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };

    $.ajax({
        url: "LikeServlet",  // Ensure this matches your servlet mapping
        type: "POST",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log("Response from server:", data);
            if (data.trim() === 'true') {
                let c = $(".like-counter").html();
                c++;
                $('.like-counter ').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("AJAX Error:", textStatus, errorThrown);
        }
    });
}