const addSecondaryFabric = () => {  
    // Method to replace content of for and id tag in template (see new.html.erb file for clothes)
    const insertForAndIdTag = (index) => {
      return `clothe_technical_details_attributes_${index}_component`;
    } 

    // Method to replace content of name tag in template (see new.html.erb file for clothes)
    const insertNameTag = (index) => {
      return `clothe[technical_details_attributes][${index}][quantity]`;
    }

    const secondaryForms = document.querySelector('#secondary-forms');

    // Select HTML template (see new.html.erb file for clothes)
    const originTemplate = document.querySelector('#secondary-form-template');
    console.log(originTemplate);
    // Select the add-secondary-fabric button
    const addSecondaryFabricButton = document.querySelector('#add-secondary-fabric');  

    let counter = 2;

    addSecondaryFabricButton.addEventListener('click', (event) => {
      const template = document.importNode(originTemplate.content, true);
      // Select label tags in the template
      const labels = template.querySelectorAll('label');
  
      // Select select tag to find id and name tag in the template
      const selects = template.querySelectorAll('select');
    
      // Find the index of the last secondary fabric form
      
      // const findIndex = labels[0].attributes.for.value.split('_');
      // const indexToNumber = parseInt(findIndex[4], 10);
      // const newIndex = indexToNumber + 1
  
      // Replace content of for, id and name tags by the newIndex thanks to the insertxxxTag methods
      labels[0].attributes.for.value = insertForAndIdTag(counter);
      selects[0].attributes.id.value = insertForAndIdTag(counter);
      selects[0].attributes.name.value = insertNameTag(counter);
      counter += 1; 
      secondaryForms.appendChild(template);
    });
}

export { addSecondaryFabric };


