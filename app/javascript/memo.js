function memo() {
  const submit = document.getElementById("m_submit");                     //送信ボタンのIDを取得
  submit.addEventListener("click", (e) => {                               //クリックした場合に実施
    const formData = new FormData(document.getElementById("m_form"));     //メモ投稿のフォームに入力された情報を取得
    const XHR = new XMLHttpRequest();                    //エンドポイントを呼び出すために、XMLHttpRequestを使用してHTTPリクエスト,変数XHRから、XMLHttpRequestのメソッドを使用できるようになります
    XHR.open("POST", "/learns/:learn_id/relearns/:relearn_id/rooms/:room_id/messages", true);                 //open(どのようなリクエストをするのかを指定),第一引数にはHTTPメソッド、第二引数にはパス、第三引数には非同期通信であるかをbooleanで記述
    XHR.responseType = "json";                           //返却されるデータ形式はJSONに
    XHR.send(formData);                                  // メモ投稿のフォームに入力された情報を送信
    XHR.onload = () => {
      if (XHR.status != 200) {                           ////レスポンスがエラーだった場合の処理
        alert(`Error ${XHR.status}: ${XHR.statusText}`); //失敗の場合にはアラートを表示
        return null;                                      //JavaScriptの処理から抜け出す。エラーが出た場合に、19行目以降に記述されている処理を行わないようにする
      }
      const item = XHR.response.message;                     //レスポンスとして返却されたメモのレコードデータを取得
      const list = document.getElementById("m_list");     //HTMLを描画する場所を指定する際に使用する「描画する親要素」のlistの要素を取得
      const formText = document.getElementById("content");//メモの入力フォームを取得
      //formTextは、メモの入力フォームを取得しています。なぜなら、送信後に入力フォームの文字列を削除するためです。
      //非同期通信では画面遷移しないため、フォーム送信後であっても、入力した文字列が残ったままになってしまいます。スムーズに投稿を行えるよう、入力した文字列はフォームを送信するたびに削除したほうが好ましい
      const HTML = `
        <div class="post" data-id=${item.id}>
          <div class="post-date">
            投稿日時：${item.created_at}
          </div>
          <div class="post-content">
            ${item.content}
          </div>
        </div>`;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();        //処理が重複しないよう,プログラム本来の処理を、止めるためにe.preventDefault();で処理を停止させます。
  });
}
window.addEventListener("load", memo);