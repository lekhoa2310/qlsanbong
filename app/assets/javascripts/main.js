$(document).ready(function(){
  $('.list-user').on('click', '.delete-user', function(event){
    var self = $(this);
    $.ajax({
      url: "/admin/users/"+$(this).attr("data-target"),
      type: "delete",
      success: function(res){
        console.log(res);
        if(res.success){
        $('.alert-success').remove();
        self.parents('.box-user').remove();
        $('.message').prepend(' \
        <ul class="alert alert-success"> \
        <li> Xóa thành công! </li>\
        </ul > \
        ');
      }

    }
  });
});

//   $('.list-course').on('click','.delete-course', function(event){
//     var self = $(this);
//     $.ajax({
//       url: "/teacher/courses/"+$(this).attr("data-target"),
//       type: "delete",
//       success: function(res){
//         console.log(res);
//         if(res.success){
//           $('.alert-success').remove();
//           self.parents('.box-course').remove();
//           $('.message').prepend(' \
//           <div class="alert alert-success"> \
//           Xóa thành công! \
//           </div> \
//           ');
//         }
//       }
//     });
//   });
//
//   $('.list-classroom').on('click', '.delete-classroom', function(event){
//     var self = $(this);
//     $.ajax({
//       url: $(this).attr("data-target"),
//       type: "delete",
//       success: function(res){
//         if(res.success){
//           $('.alert-success').remove();
//           self.parents('.box-classroom').remove();
//           $('.message').prepend(' \
//           <div class="alert alert-success"> \
//           Xóa thành công! \
//           </div> \
//           ');
//
//         }
//       }
//     });
//   });
//
//
//   $('.list-classroom').on('click', '.register-classroom', function(event){
//     var self = $(this);
//     $.ajax({
//       url: $(this).attr("data-target"),
//       type: "post",
//       success: function(res){
//         if(res.success == true){
//         self.parents('.list-classroom').find('.view-registers').html(res.data.registers);
//         if(res.data.is_register == false)
//           self.html("Đăng ký");
//         else
//           self.html("Hủy Đăng ký");
//       }
//
//     else {
//         $('.alert-success').remove();
//       $('.message').prepend(' \
//       <div class="alert alert-success"> \
//       Lớp đã đầy! \
//       </div> \
//       ');
//     }
//
//     }
//   });
// });
//
//
//   $('.list-user').on('click', '.pay-fee', function(event){
//     event.preventDefault();
//     var self = $(this);
//     $.ajax({
//       url: self.attr("data-target"),
//       type: "post",
//       success: function(res){
//         if(res.data.is_pay == false)
//           self.html("Nợ");
//         else
//           self.html("Xong");
//       }
// });
// });

});
