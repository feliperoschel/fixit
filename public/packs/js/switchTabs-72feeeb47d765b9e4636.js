/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/switchTabs.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/switchTabs.js":
/*!********************************************!*\
  !*** ./app/javascript/packs/switchTabs.js ***!
  \********************************************/
/*! exports provided: switchTabs */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "switchTabs", function() { return switchTabs; });
var _this = undefined;

var addClassSelected = function addClassSelected(target) {
  // take parent class -> get children -> remove classes for all children
  var children = target.parentElement.children;
  var childAmount = target.parentElement.childElementCount;

  for (var i = 0; i < childAmount; i++) {
    children[i].classList.remove("selected");
  } // add class


  target.classList.add("selected");
};

var switchTabs = function switchTabs() {
  _this.addEventListener("click", function (e) {
    // INIT 
    var className = e.target.className;
    var whereToShow = document.querySelector(".show-res"); // INJECT HTML

    if (className == "bookings" && document.querySelector(".allbookings-div") === null) {
      addClassSelected(e.target);
      whereToShow.innerHTML = ""; // SHOW ALL BOOKINGS

      whereToShow.insertAdjacentHTML("beforeend", "\n        <% @bookings.each do |booking| %>\n        <div class='card-product allbookings-div'>\n            <%= cl_image_tag booking.painting.photo, height: 300, width: 400, crop: :fill %>\n            <div class='card-container'>\n            <div class='card-product-infos'>\n                <h2>\n                <%= booking.painting.title %> by <%= current_user.first_name %> <%= current_user.last_name %> -\n                <span class='price'><%= booking.painting.price %>/per day</span>\n                </h2>\n                <p><%= booking.painting.description %></p>\n                <p>Booking date : <%= booking.start_date %> - <%= booking.end_date %> </p>\n            </div>\n            <div>\n                <%= link_to 'Review', new_painting_review_path(booking.painting)  %> /\n                <%= link_to 'edit', edit_booking_path(booking)  %>\n            </div>\n            </div>\n        </div>\n        <% end %>\n        ");
    } else if (className == "all-paintings" && document.querySelector(".allpaintings-div") === null) {
      addClassSelected(e.target);
      whereToShow.innerHTML = ""; // SHOW ALL PAINTINGS

      whereToShow.insertAdjacentHTML("beforeend", "\n        <% @paintings.each do |painting|%>\n            <div class='card-product allpaintings-div'>\n            <%= cl_image_tag painting.photo, height: 300, width: 400, crop: :fill %>\n            <div class='card-container'>\n                <div class='card-product-infos'>\n                <h2>\n                    <%= painting.title %> -\n                    <span class='price'><%= painting.price %>/per day</span>\n                </h2>\n                <p><%= painting.description %></p>\n                <!-- IF BOOKING EXIST THEN SHOW BOOKING DATE -->\n                <% unless painting.bookings == [] %>\n                <p>Booking date : <%= painting.bookings.first.start_date %> - <%= painting.bookings.first.end_date %> </p>\n                <% end %>\n                </div>\n                <!-- IF BOOKING EXIST THEN SHOW USER -->\n                <% unless painting.bookings == [] %>\n                <div>\n                    <p>rented by <%= painting.bookings.first.user.first_name %> <%= painting.bookings.first.user.last_name %></p>\n                </div>\n                <% end %>\n            </div>\n            </div>\n        <% end %>\n        ");
    } else if (className == "rented" && document.querySelector(".rented-div") === null) {
      addClassSelected(e.target);
      whereToShow.innerHTML = ""; // SHOW ALL RENTED PAINTINGS

      whereToShow.insertAdjacentHTML("beforeend", "\n        <% @paintings.each do |painting| %>\n        <% painting.bookings.each do |booking| %>\n            <div class='card-product rented-div'>\n            <%= cl_image_tag booking.painting.photo, height: 300, width: 400, crop: :fill %>\n            <div class='card-container'>\n                <div class='card-product-infos'>\n                <h2>\n                    <%= booking.painting.title %> -\n                    <span class='price'><%= booking.painting.price %>/per day</span>\n                </h2>\n                <p><%= booking.painting.description %></p>\n                <p>Booking date : <%= booking.start_date %> - <%= booking.end_date %> </p>\n                </div>\n                <div>\n                <p>rented by <%= booking.user.first_name %> <%= booking.user.last_name %></p>\n                </div>\n            </div>\n            </div>\n        <% end %>\n        <% end %>\n        ");
    }
  });
};



/***/ })

/******/ });
//# sourceMappingURL=switchTabs-72feeeb47d765b9e4636.js.map