//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require codemirror
//= require codemirror/modes/ruby
//= require codemirror/modes/javascript
//= require codemirror/modes/python
//= require codemirror/modes/php
//= require_tree .

//apiUrl = "http://localhost:8080/compile";
apiUrl = "http://ec2-52-24-172-142.us-west-2.compute.amazonaws.com:8080/compile";

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

  function showTestHeader() {
    $("#testHeader").html("<h3>Test results</h3>");
  }

  function showLoadingGif() {
    $("#loader").html("<img src='/assets/ajax-loader.gif' alt='loading' />")
  }

  function showSyntax(data) {
    var syntax_message;
    if (data.output) {
      syntax_message = "<pre class=\"message-syntax-ok\">Syntax OK</pre>";
    } else {
      syntax_message += '<pre class=\"message-syntax-error\">' + data.errors +  '</pre>';
    }
    $("#output").html(syntax_message);
  }
  function showCodeOutput(data) {
    var syntax_message = "<h4>Compiler message:</h4>";
    if (data.output) {
      syntax_message += "<pre class=\"message-syntax-ok\">Syntax OK</pre>";
      syntax_message += "<h4>Compiler output:</h4>"
      syntax_message += "<pre>" + data.output + "</pre>";
    } else {
      syntax_message += '<pre class=\"message-syntax-error\">' + data.errors +  '</pre>';
    }
    $("#output").html(syntax_message);
  }

  function showProgressBar() {
    $("#progressBar").html(
      "<div id=\"progress\"><div id=\"bar\"><span>0%</span></div></div>"
    );
  }

  function updateProgressBar(tagetWidth) {
    var elem = document.getElementById("bar");
    var width = 0;
    var id = setInterval(frame, 10);
    function frame() {
      if (width >= tagetWidth) {
        clearInterval(id);
      } else {
        width++;
        elem.style.width = width + '%';
        elem.innerHTML = width * 1 + '%';
        elem.style.paddingLeft = "20px";
      }
    }
  }

  function calculateTestOutput(num, data) {
    return (num - data.output.testFailures.length)/num * 100
  }

  function showPassedTests(passed, total) {
    $("#passedTests").html("<div>" +
      passed + "/" + total + "</div>")
  }

