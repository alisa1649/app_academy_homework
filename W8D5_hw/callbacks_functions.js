window.setTimeout(function () {
    alert('HAMMERTIME');
}, 5000);

hammerTime = function (time) {
    window.setTimeout(function () {
        alert(`${time} is hammertime!`);
    }, time)
};