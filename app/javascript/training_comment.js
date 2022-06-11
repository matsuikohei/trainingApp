function post (){
  const commentSubmitButton = document.getElementsByClassName("comment-submit-btn")[0];
  commentSubmitButton.addEventListener('click', (e) => {
    e.preventDefault();
    const trainingCommentForm =  document.getElementsByClassName("training-comments-form")[0];
    const trainingId = document.getElementById("training-id").value
    const formData = new FormData(trainingCommentForm);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/trainings/${trainingId}/training_comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
};

window.addEventListener('load', post);