//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/javascript
//= require codemirror/modes/python
//= require codemirror/modes/php
//= require_tree .

apiUrl = "http://localhost:8080/compile";

  function codeMirrorInit(elementId, language, userCode) {
    var excercise_attempt_area = $(elementId)[0];
    var textEditor = CodeMirror.fromTextArea(excercise_attempt_area, {
      mode: language.toLowerCase(),
      lineNumbers: true,
      lineWrapping: true
    });
    textEditor.getDoc().setValue(userCode);
    return textEditor;
  }

  function showCodeOutput(data) {
    var syntax_message;
    if (data.output) {
      syntax_message = "<p class=\"output-message\">Compile message:</p><pre class=\"message-syntax-ok\">Syntax OK</pre>";
    } else {
      syntax_message = "<p class=\"message-syntax-error\">Compile time error. Check your syntax!</p>";
    }
    $("#output").html(syntax_message);
  }
