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
//= require_tree .

var defaults = {
  // CSS selectors and attributes that would be used by the JavaScript functions
  todoTask: "todo-task",
  todoHeader: "task-header",
  todoDate: "task-date",
  todoDescription: "task-description",
  taskId: "task-",
  formId: "todo-form",
  dataAttribute: "data",
  deleteDiv: "delete-div"
}, codes = {
  "1" : "#pending", // For pending tasks
  "2" : "#inProgress",
  "3" : "#completed"
};

// Add Task
var generateElement = function(params) {
  var parent = $(codes[params.code]),
      wrapper;
 
  if (!parent) {
    return;
  }
 
  wrapper = $("<div />", {
    "class" : defaults.todoTask,
    "id" : defaults.taskId + params.id,
    "data" : params.id
  }).appendTo(parent);
 
  $("<div />", {
    "class" : defaults.todoHeader,
    "text": params.title
  }).appendTo(wrapper);
 
  $("<div />", {
    "class" : defaults.todoDate,
    "text": params.date
  }).appendTo(wrapper);
 
  $("<div />", {
    "class" : defaults.todoDescription,
    "text": params.description
  }).appendTo(wrapper);
};

generateElement({
  id: "123",
  code: "1",
  title: "My Uber Important Task",
  date: "5/2/2014",
  description: "I have to do a lot of steps to implement this task!"
});

var removeElement = function(params) {
  $("#" + defaults.taskId + params.id).remove();
};

var data = JSON.parse(localStorage.getItem("todoData"));
{
  id : id, // Unique ID; timestamp is used here
  code: "1", // Code identifying the category
  title: title, // Title of the task
  date: date, // Due date
  description: description // Description of the task
}

localStorage.setItem("todoData", JSON.stringify(data));

var addItem = function() {
  var inputs = $("#" + defaults.formId + " :input"),
      errorMessage = "Title can not be empty",
      id, title, description, date, tempData;
 
  if (inputs.length !== 4) {
    return;
  }
 
  title = inputs[0].value;
  description = inputs[1].value;
  date = inputs[2].value;
 
  if (!title) {
    generateDialog(errorMessage);
    return;
  }
 
  id = new Date().getTime();
 
  tempData = {
    id : id,
    code: "1",
    title: title,
    date: date,
    description: description
  };
 
  // Saving element in local storage
  data[id] = tempData;
  localStorage.setItem("todoData", JSON.stringify(data));
 
  // Generate Todo Element
  generateElement(tempData);
 
  // Reset Form
  inputs[0].value = "";
  inputs[1].value = "";
  inputs[2].value = "";
};

$("." + defaults.todoTask).draggable();
 
// Add Task
var generateElement = function(params) {
  wrapper.draggable({
    start: function() {
      $("#" + defaults.deleteDiv).show();
    },
    stop: function() {
      $("#" + defaults.deleteDiv).hide();
    }
  });
...
};


// Adding drop function to each category of task
$.each(codes, function(index, value) {
  $(value).droppable({
    drop: function(event, ui) {
      var element = ui.helper,
          css_id = element.attr("id"),
          id = css_id.replace(options.taskId, ""),
          object = data[id];
 
      // Removing old element
      removeElement(object);
 
      // Changing object code
      object.code = index;
 
      // Generating new element
      generateElement(object);
 
      // Updating Local Storage
      data[id] = object;
      localStorage.setItem("todoData", JSON.stringify(data));
 
      // Hiding Delete Area
      $("#" + defaults.deleteDiv).hide();
    }
  });
});


// Adding drop function to delete div
$("#" + options.deleteDiv).droppable({
  drop: function(event, ui) {
    var element = ui.helper,
        css_id = element.attr("id"),
        id = css_id.replace(options.taskId, ""),
        object = data[id];
 
    // Removing old element
    removeElement(object);
 
    // Updating local storage
    delete data[id];
    localStorage.setItem("todoData", JSON.stringify(data));
 
    // Hiding Delete Area
    $("#" + defaults.deleteDiv).hide();
  }
});