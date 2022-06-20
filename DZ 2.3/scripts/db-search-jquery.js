$(document).ready(() => {
    const $searchInput = $('#search');

    $searchInput.keyup(e => {
        const $element = $(e.currentTarget); 
        const searchInputValue = $element.val();
        $.get(`search.php?s=${searchInputValue}`, (data, status) => {
        if (status !== 'success') return;
        printData(JSON.parse(data));
        });
    });
});

function printData(data) {
    const searchResult = $('.search-result').get(0);
    const searchResultData = $('.search-result-data').get(0);

    if (!data || !data.length) {
        searchResult.classList.remove('visible');
        $(searchResultData).html('');
        return;
    }

    searchResult.classList.add('visible');
    let htmlContent = '';
    data.forEach(item => {
        htmlContent += `<strong>${item.naziv}</strong><br><p>${item.opis}</p>`;
    });
    
    $(searchResultData).html(htmlContent);
}