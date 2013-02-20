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
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .


$(function() {
	$("input#applicant_date_due").datepicker({dateFormat: 'D, M dd yy'});
	$("input#teacher_recommendation_date_submitted").datepicker({dateFormat: 'D, M dd yy'});
});


$(function() {
  $("#ajaxtable th a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
	$("#applicants_search input").keyup(function() {
		$.get($("#applicants_search").attr("action"), $("#applicants_search").serialize(), null, "script");
		return false;
	});
});




