const APIUtil = require("./api_util");

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