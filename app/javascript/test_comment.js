function post (){
  const commentSubmitButton = document.getElementsByClassName("comment-submit-btn")[0];
  commentSubmitButton.addEventListener('click', (e) => {
    e.preventDefault();
    const testCommentForm =  document.getElementsByClassName("training-comments-form")[0];
    const testId = document.getElementById("test-id").value
    const formData = new FormData(testCommentForm);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/tests/${testId}/test_comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const comment = document.getElementsByClassName("comments")[0];
      const formText = document.getElementById("test_comment_content");
      const item = XHR.response.post;
      const commentCreatedAt = XHR.response.comment_created_at;
      const test = XHR.response.test;
      const current_user = XHR.response.current_user;
      const user = XHR.response.user;
      let deleteImage = "";
      if ( current_user.id == item.user_id ) {
        deleteImage = `<a rel=\"nofollow\" data-method=\"delete\" href=\"/tests/${test.id}/test_comments/${item.id}\"><img alt=\"icon\" src=\"/assets/delete_icon-01bc7ef48b9443861f7869730588aa754f5cc83396e3bc4bc10fb0a5d4af2afd.svg\" width=\"15\" height=\"15\"></a>`;
      }
      const html = `
        <div class="comment">
          <div class="comment-delete">
            ${deleteImage}
          </div>
          <div class="comment-info">
            ${commentCreatedAt} ${user.last_name}${user.first_name}
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