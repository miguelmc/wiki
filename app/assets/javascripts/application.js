// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tagsinput.min
//= require difflib
//= require diffview
//= require_tree .
//

$(function() {

  function diff() {
    // get the baseText and newText values from the two textboxes, and split them into lines
    var base = difflib.stringAsLines($(".antes").text());
    var newtxt = difflib.stringAsLines($(".despues").text());

    // create a SequenceMatcher instance that diffs the two sets of lines
    var sm = new difflib.SequenceMatcher(base, newtxt);

    // get the opcodes from the SequenceMatcher instance
    // opcodes is a list of 3-tuples describing what changes should be made to the base text
    // in order to yield the new text
    var opcodes = sm.get_opcodes();

    var diffoutputdiv = $(".log-changes");
    while (diffoutputdiv.firstChild) diffoutputdiv.removeChild(diffoutputdiv.firstChild);

    $(".antes").remove();
    $(".despues").remove();

    // build the diff view and add it to the current DOM
    diffoutputdiv.append(diffview.buildView({
        baseTextLines: base,
        newTextLines: newtxt,
        opcodes: opcodes,
        //set the display titles for each resource
        baseTextName: "Antes",
        newTextName: "Despues",
        contextSize: null,
        viewType: 0
      }));
  }

  $("#tag").autocomplete({
    source: $("#tag").data("tags")
  });

  diff();

});


