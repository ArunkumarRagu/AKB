var AKB = {
  applyBehaviors: function (scope) {
    $("[data-behavior]", scope)
      .addBack("[data-behavior]")
      .each(function () {
        var $el = $(this);
        var behaviorsToApply = $el.attr("data-behavior").split(" ");
        $.each(behaviorsToApply, function (i, behaviorName) {
          if (!AKB.Behaviors[behaviorName]) {
            throw behaviorName + " does not exist in AKB.Behaviors";
          }
          AKB.Behaviors[behaviorName].apply($el);
        });
      });
  },
  reload: function () {
    window.location.reload();
  },
  redirect: function (location) {
    window.location.replace(location);
  },
  isSmall: function () {
    return (
      matchMedia(Foundation.media_queries["small"]).matches &&
      !matchMedia(Foundation.media_queries.medium).matches
    );
  },
  isMedium: function () {
    return (
      matchMedia(Foundation.media_queries["medium"]).matches &&
      !matchMedia(Foundation.media_queries.large).matches
    );
  },
  isLarge: function () {
    return matchMedia(Foundation.media_queries["large"]).matches;
  },
  history: {
    pushState: function () {
      setTimeout(function () {
        var event = new CustomEvent("akb.location_changed", {
          view: window,
          bubbles: true,
          cancelable: true,
          context: "pushState",
          detail: "pushState",
        });
        document.body.dispatchEvent(event);
      }, 100);
      return history.pushState.apply(history, arguments);
    },
    replaceState: function () {
      setTimeout(function () {
        var event = new CustomEvent("akb.location_changed", {
          view: window,
          bubbles: true,
          cancelable: true,
          context: "pushState",
          detail: "pushState",
        });
        document.body.dispatchEvent(event);
      }, 100);
      return history.replaceState.apply(history, arguments);
    },
  },
  block_ui: function ($this) {
    $this.block({
      message: '<img src="/images/ajax-loader.gif">',
      css: {
        backgroundColor: "transparent",
        border: "none",
        opacity: 1,
        justifyContent: "center",
        "z-index": 98,
      },
      overlayCSS: {
        backgroundColor: "#fff",
        width: "100%",
      },
    });
  },
  unblock_ui: function ($this) {
    $this.unblock();
  },
  Behaviors: {},
};
