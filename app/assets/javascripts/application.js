// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
    
    $(function(){
        
            $('#search_submit').on('click',function(event) {

                event.preventDefault();
                var searchValue = $('#search_field').val();

                $.getScript('/products?search_field='+searchValue)

                })

            $(window).on('scroll',function(){

                var threshold = $(document).height() - $(window).height() - 50

                var action = $(window).scrollTop() - threshold

                if (action > 0 && $(".pagination .next a").attr('href')) {

                    $.getScript($(".pagination .next a").attr('href'))
                    $(".pagination").html("Next page is loading")

                 }


                })

            })

