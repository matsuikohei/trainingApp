import consumer from "./consumer"
if(location.pathname.match(/\/tests\/\d/)){

  consumer.subscriptions.create({
    channel: "TestCommentChannel",
    test_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      console.log(data);
      let deleteImage = "";
      if ( data.current_user.id == data.post.user_id ) {
        deleteImage = `<a rel=\"nofollow\" data-method=\"delete\" href=\"/tests/${data.test.id}/test_comments/${data.post.id}\"><img alt=\"icon\" src=\"/assets/delete_icon-01bc7ef48b9443861f7869730588aa754f5cc83396e3bc4bc10fb0a5d4af2afd.svg\" width=\"15\" height=\"15\"></a>`;
      }
      const html = `
        <div class="comment">
          <div class="comment-delete">
            ${deleteImage}
          </div>
          <div class="comment-info">
            ${data.comment_created_at} ${data.user.last_name}${data.user.first_name}
          </div>
          <div class="comment-text">
            ：${data.post.content}
          </div>
        </div>`;
      const comment = document.getElementsByClassName("comments")[0];
      comment.insertAdjacentHTML('beforeend', html);
      const formText = document.getElementById("test_comment_content");
      formText.value = "";
    }
  });
}
