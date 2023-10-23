$(document).on('click', '#open-address-form', function () {
      $.ajax({
        url: '<%= new_address_path %>',
        type: 'GET',
        dataType: 'html',
        success: function (data) {
          $('#address-form-container').html(data);
        },
        error: function () {
          alert('An error occurred while loading the review form.');
        }
      });
    });
    $(document).on('click', '#cancel', function () {
         $('#address-form-container').html("");
    });

    $(document).on('click', '#open-edit-form', function(){
      $.ajax(
      {
        url: '/addresses/<%= cookie[:user_id] %>/edit',
        type: 'GET',
        dataType: 'html',
        success: function (data) {
          $('.showAddress').hide();
          $('#addHead').hide();
          $('.editAddress').html(data);
          $('#open-edit-form').hide();
        },
        error: function (){
          alert('Error occurs in editing')
        }
      })
    })