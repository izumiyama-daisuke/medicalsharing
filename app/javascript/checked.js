function check() {
  const messages = document.querySelectorAll(".message"); //チャット投稿の外枠を取得
  messages.forEach(function (message) {                  //複数取得した要素（messages）に対して、forEachで繰り返し処理を行い要素1つずつに対して処理を行う

    if (message.getAttribute("data-load") != null) {       //addEventListenerが重複して追加されることを回避、１度目はnull1なのでスルーされる
      return null;
    }
    message.setAttribute("data-load", "true");           //(１回目)要素にdata-load = "true"と属性を追加

    message.addEventListener("click", () => {            //複数取得した単体をクリックした時に実行
      const messageId = message.getAttribute("data-id"); //getAttributeで属性値を取得することができるので、メモのidを取得
      const XHR = new XMLHttpRequest();                  //エンドポイントを呼び出すために、XMLHttpRequestを使用してHTTPリクエスト,変数XHRから、XMLHttpRequestのメソッドを使用できるようになります
      XHR.open("GET", `/messages/${messageId}`, true);   //open(どのようなリクエストをするのかを指定),第一引数にはHTTPメソッド、第二引数にはパス、第三引数には非同期通信であるかをbooleanで記述
      XHR.responseType = "json";                         //responseTypeメソッドを使用して、レスポンスの形式を指定
      XHR.send();                                        //send(XMLHttpRequestで定義されているメソッドで、リクエストを送信),引数の指定はとくに必要ありませ


      //checked.jsに、レスポンスがあった場合の処理

      XHR.onload = () => {
        if (XHR.status != 200) {                            //レスポンスがエラーだった場合の処理
          alert(`Error ${XHR.status}: ${XHR.statusText}`);  //失敗の場合にはアラートを表示
          return null;                                      //JavaScriptの処理から抜け出す。エラーが出た場合に、19行目以降に記述されている処理を行わないようにする
        }
        const item = XHR.response.message;               //XHR.responseでレスポンスされてきたJSONにアクセスできます.コントローラーのcheckedアクションで返却したitemは、XHR.response.postで取得
        if (item.checked === true) {
          message.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          message.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(check, 1000);                                //setIntervalを使用し、check関数が1秒に1度実行される
//window.addEventListener("load", check);                  //window（ページ）をload（読み込み）した時に実行
