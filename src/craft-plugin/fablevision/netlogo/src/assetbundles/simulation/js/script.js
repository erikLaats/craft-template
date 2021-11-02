var fv = (function(self){

	var headers, userId, journeyId, taskId;

	function initialize() {
        userId = window.__USER_ID__;
        journeyId = window.__JOURNEY_ID__;
        taskId = window.__TASK_ID__;
		headers = generateHeader();
	}

    function loadProgress(onSuccess) {
        var url = generateUrl("load-progress");
        var data = generateBody({userId: userId, journeyId: journeyId, taskId: taskId});
        $.ajax({
                url: url,
                type: "post",
                data: JSON.stringify(data),
                contentType: "application/json",
                headers: headers,
                success: function(result) {
                    trace("progress retrieved", result);
                    if(onSuccess) onSuccess(result);
                },
                error: onPostError
        });
        return "loading...";
    }

    function saveProgress(progress) {
        var url = generateUrl("save-progress");
        var data = generateBody({userId: userId, journeyId: journeyId, taskId: taskId, progress: progress});
        $.ajax({
                url: url,
                type: "post",
                data: JSON.stringify(data),
                contentType: "application/json",
                headers: headers,
                success: function(result) {
                    trace("progress saved", result)
                },
                error: onPostError
        });
        return "saving...";
    }


	function generateUrl(method) {
            return __SERVICE_URL__ + "/" + method;
    }

    function generateHeader() {
            return {"Content-Type": "application/json" ,"X-Requested-With": "XMLHttpRequest"};
    }

    function generateBody(params) {
            var body = {};
            body[__CSRF_TOKEN_NAME__] = __CSRF_TOKEN__;

            for(var prop in params) {
                    body[prop] = params[prop];
            }

            return body;
    }

    function post(url, body) {

        $(".submit").attr("disabled","disabled");

        $.ajax({
                url: url,
                type: "post",
                data: JSON.stringify(body),
                contentType: "application/json",
                headers: headers,
                success: onAccountValidation,
                error: onPostError
        });
    }

    function onPostError() {
        console.error("server error");
        console.error(arguments);
    }

	function trace() {
		for(var i = 0, count = arguments.length; i < count; i++) {
			console.log(arguments[i]);
		}
	}
	$(document).ready(initialize);

    self.loadProgress = loadProgress;
    self.saveProgress = saveProgress;
    return self;
}(fv = fv || {}));