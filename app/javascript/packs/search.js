document.addEventListener("turbolinks:load", function() {

    $input = $('*[data-behavior="autocomplete"]')

    var options = {
        url: function(phrase) {
            return "/resources/search.json?q=" + phrase;
        },
        getValue: "name",
        template: {
            type: "links",
            fields: {
                link: "link"
            }
        },
    };

    $input.easyAutocomplete(options);

});