import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template", "container", "field"]

    addPassenger(e) {
        e.preventDefault();
        if (this.containerTarget.children.length < 5) {
            const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
            this.containerTarget.insertAdjacentHTML('beforeend', content);
        } else {
            alert('You can only add up to 5 passengers');
        }

    }

    removePassenger(e) {
        e.preventDefault();
        let container = document.querySelector('[data-passenger-target="container"]');
        if (container.querySelectorAll('.passenger-field').length > 1) {
            e.target.closest('.passenger-field').remove();
        } else {
            alert('You must have at least one passenger');
        }
    }

}
