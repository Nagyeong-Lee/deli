var new_name_list = new Array();
var del_list = new Array();

$("#cancleBtn").on("click", function () {
    location.reload();
})

//내 리뷰 관리로 이동
$("#backBtn").on("click", function () {
    location.href = "/";
})

//지우기
$(".del_img_btn").on("click", function () {
    let rev_img_div = $(this).closest(".review_img_div");


    del_list.push(rev_img_div.find(".img_name").val());
    $("#del_files_json").val(JSON.stringify(del_list));
    console.log(del_list);
    rev_img_div.remove();
})

// 파일 업로드시 파일명 삽입 기능
$('#revImgBtn').on('change', function () {
    filesTest($(this)[0]);
})

function filesTest(element) {  // 값이 변경되면
    const files = element.files;


    for (const file of files) {
        var filename = file.name.split('/').pop().split('\\').pop();
        console.log(filename);
        var ext = filename.split('.').pop().toLowerCase(); //확장자분리
        //아래 확장자가 있는지 체크

        if ($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png', 'pdf']) == -1) {
            Swal.fire({
                icon: 'error',
                title: '파일 형식 오류',
                text: 'jpg, jpeg, gif, png, pdf 파일만 업로드할 수 있습니다.',
            })
            element.value = "";

            return;
        } else {
            new_name_list.push(filename);
        }
    }

    new_name_list.forEach((new_name) => {
        $('#new_file_name_list').append(new_name);
    });
};

// $(function () {
//     let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();
//     let arr =
//
//
//     // fileToBase64(document.getElementById("revImgBtn").files[0]);
// })

// $("#revImgBtn").on("change",function(){
//     // if($("#revImgBtn").val()==""){
//     //     $("#profile").attr("src","/images/profile.png");
//     //     return;
//     // }
//     let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();// 업로드한 파일명을 점을 기준으로 배열을 만들고 마지막 배열의 값을 꺼내고 소문자로 만들어줌
//     // let accept =["png","jpg","jpeg","gif"]; // 업로드 가능한 파일 타입을 배열로 만듦
//     // let result = $.inArray(ext,accept);// 첫번째 인자값이, 두번째 인자 배열안에 존재한다면 0이상, 존재하지 않는다면 -1을 반환
//     // if(result == -1){
//     //     alert("이미지만 사용 가능합니다.");
//     //     $("#revImgBtn").val("");// accept에 없는 파일을 올릴 경우 경고창을 띄우면서 업로드한 파일을 지움
//     // }
//     fileToBase64(document.getElementById("revImgBtn").files[0]);
// })