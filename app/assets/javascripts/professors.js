$(function() {
    $('.name').tooltip({
        content: function(callback) {
            var id = $(this).prev().html();
            $.getJSON('/professors/'+id+'/subjects.json', function(subjects) {
                var html = "<ul>";
                $.each( subjects, function(i, subject){
                    html += "<li>"+subject.name+"</li>";
                });
                html += "</ul>";
                callback(html);
            });
            return 'loading...';
        }
    });
});