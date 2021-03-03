const formSteps = () => {

    const goToSteps = document.querySelectorAll('.go-to-step');
    console.log(goToSteps);
    goToSteps.forEach( (step) => {
        step.addEventListener( 'click', (event) => {
            const clickOnStep = document.getElementById(event.currentTarget.dataset.target);
            console.log(clickOnStep);
            const newActiveClass = clickOnStep.classList.add('active');
            clickOnStep.style.display = "";
            const formerActiveClass = clickOnStep.previousElementSibling.classList.remove('active');
            clickOnStep.previousElementSibling.style.display = "none";
        });
    });
}

export { formSteps };