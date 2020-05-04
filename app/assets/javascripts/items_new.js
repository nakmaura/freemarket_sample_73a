$(document).on('turbolinks:load', ()=> {
  let buildFileField = (index)=> {
    let html =  `<div class="js-file_group" data-index="image.index">
    '<input class="sell-container__content__upload__items__box__input" type="file" 
      name="item[images_attributes][${index}][url]" id="item_images_attributes_0_url"></div>`;
    
    return html;
  }

let fileIndex = [1,2,3,4,5,6,7,8,9,10];

$('#image-input').on('change','.sell-container__content__upload__items__box__input',function(e){
  let i = 0
  if (i < 10){
  $('#image-input').append(buildFileField(fileIndex[i]));
  fileIndex.shift();
  fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  }
  });
})