function previewFileWithId(selector) {
  const target = event.target;
  const file = target.files[0];
  const reader = new FileReader();
  reader.onloadend = function() {
    selector.src = reader.result;
  }
  if (file) {
    reader.readAsDataURL(file);
  } else {
    selector.src = ''
  }
}