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
    XHR.onload = () => {
      const comment = document.getElementsByClassName("comments")[0];
      const formText = document.getElementById("training_comment_content");
      const item = XHR.response.post;
      const commentCreatedAt = XHR.response.comment_created_at;
      const training = XHR.response.training;
      const current_user = XHR.response.current_user;
      let deleteImage = "";
      if ( current_user.id == item.user_id ) {
        deleteImage = `<a rel=\"nofollow\" data-method=\"delete\" href=\"/trainings/${training.id}/training_comments/${item.id}\"><img alt=\"icon\" src=\"/assets/delete_icon-01bc7ef48b9443861f7869730588aa754f5cc83396e3bc4bc10fb0a5d4af2afd.svg\" width=\"15\" height=\"15\"></a>`;
      }
      const html = `
        <div class="comment">
          <div class="comment-delete">
            ${deleteImage}
          </div>
          <div class="comment-info">
            ${commentCreatedAt}
          </div>
          <div class="comment-text">
            ：${item.content}
          </div>
        </div>`;
      comment.insertAdjacentHTML('beforeend', html);
      formText.value = "";
    };
  });
};

window.addEventListener('load', post);