
           $(function () {
               $(document).on('click', '.repeat', function (e) {
                    e.preventDefault();
                    var x = $('.parent').children('div:first');
                    
                    $('.repeatable').parent('div.parent').append($('.parent').children('div:first').html());
                    /*var x = $('.parent').children('div:first');
                    var y = x.children();
                    $('.repeatable').parent('div.parent').append(str);*/
                }); 
            });
        </script>
        <script>
        $(function () {
               $(document).on('click', '.remove', function (e) {
                    e.preventDefault();
                    var x = $('.parent').parent('div:last');
                    $('.repeatable').parent('div.children').remove($('.parent').parent('div:last').html());
                    /*var x = $('.parent').children('div:last');
                    var y = x.parent();
                    $('.repeatable').parent('div.children').remove(str);*/
                });
            });
