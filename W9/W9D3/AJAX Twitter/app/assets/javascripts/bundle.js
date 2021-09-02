/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: 'POST',
      dataType: 'JSON'
    })
  },

  unfollowUser: id => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: 'DELETE',
      dataType: 'JSON'
  })
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle {
    constructor(el){
        this.$el = $(el);
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        this.render();
        // installing (setting up) handleClick
        this.$el.on("click", this.handleClick.bind(this));
    }
    
    render(){
        console.log(this.followState);
        if(this.followState === "followed"){
            // alert("Follow!");
            this.$el.html("Unfollow!");
        } else if (this.followState === "unfollowed") {
            // alert("Unfollow!");
            this.$el.html("Follow!");
        }
    }

    handleClick(){
        event.preventDefault();
        // if !follows(user)
        if (this.followState === "unfollowed"){
            APIUtil.followUser(this.userId)
              .then((response) => {
                  // console.log(response);
                  this.$el.data("initial-follow-state", "followed");
                  this.followState = "followed";
                  this.render();
              }).fail(() => {
                  alert("Already following");
              });
        } else if (this.followState === "followed"){
            APIUtil.unfollowUser(this.userId)
              .then((response) => {
                  // console.log(response);
                  this.$el.data("initial-follow-state", "unfollowed");
                  this.followState = "unfollowed";
                  this.render();
              }).fail(() => {
                  alert("Already unfollowed");
              });
        }
    }
    
}



module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

$(() => {
  $("button.follow-toggle").each((idx, el) => {
    new FollowToggle(el);

  })
})




// $("li").each(function (index) {
//     console.log(index + ": " + $(this).text());
// });

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map