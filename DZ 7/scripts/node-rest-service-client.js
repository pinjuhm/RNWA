$(document).ready(() => {
    // Authorization data
    const USER = 'admin';
    const PASS = 'admin123';

    const $worldDatabaseMenuItem = $('.js-hospital');

    $worldDatabaseMenuItem.on('click', async e => {
        e.preventDefault();
        
        try {
            const url = 'http://localhost:3000/hospital';
            let headers = new Headers();
            headers.set('Authorization', 'Basic ' + btoa(`${USER}:${PASS}`));

            const response = await fetch(url, {headers});
            const data = await response.json();
            if (data.error) {
                throw new Error(data.error);
            }

            printData(data.data);
            $('.js-delete-item').on('click', e => {
                e.preventDefault();
                const $this = $(e.currentTarget);
                const {id} = $this.data();
                deleteItem(id);
            });
        }  catch (error) {
            console.error(error);
        }
    });
});

function printData(data) {
    if (!data || !data.length) {
        return;
    }

    const $main = $('.js-main');
    const $resultContainer = $('#node-rezultat');
    const $containerList = $main.find('[id]').not($resultContainer);
    $containerList.hide();

    let htmlContent = `<table class="table-list"><tr><td>Naziv</td><td>Opis</td></tr>`;
    data.forEach(item => {
        htmlContent += `<tr><td>${item.naziv}</td><td>${item.opis}</td><td>
        <a href="#" class="js-delete-item" data-id="${item.id}">
            Izbriši
        </a></td></tr>`;
    });

    htmlContent += '</table>';
    $resultContainer.html(htmlContent);
}

async function deleteItem(id) {  
    const $worldDatabaseMenuItem = $('.js-hospital');
    let headers = new Headers();
    headers.set('Authorization', 'Basic ' + btoa(`${USER}:${PASS}`));

    try {
        const url = `http://localhost:3000/hospital/${id}`;
        const response = await fetch(url, {method: 'DELETE', headers});
        const data = await response.json();
        if (data.error) {
            throw new Error(data.error);
        }

        $worldDatabaseMenuItem.trigger('click');
    
    }  catch (error) {
        console.error(error);
    }
}