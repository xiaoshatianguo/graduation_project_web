

/**
 * @function escapeHTML 转义html脚本 < > & " '
 * @param a - 字符串
 */
function escapeHTML(a) {
  a = '' + a;
  return a
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}
/**
 * @function unescapeHTML 还原html脚本 < > & " '
 * @param a - 字符串
 */
function unescapeHTML(a) {
  a = '' + a;
  return a
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&apos;/g, "'");
}

/**
 * @function set 存储session
 * @param key - key值
 * @param value - value值
 */
function cacheSet(key, value, ttl = 24 * 60 * 60 * 1000) {
  sessionStorage.setItem(
    key,
    JSON.stringify({
      data: value,
      expiredTime: new Date().getTime() + ttl,
    })
  );
}

function cacheGet(key) {
  const getItem = sessionStorage.getItem(key);

  if (getItem && JSON.parse(getItem).expiredTime > new Date().getTime()) {
    return JSON.parse(getItem).data;
  }
  return false;
}

/**
 * 获取地址栏参数值
 * @param {*} name 需要获取的属性
 */
function getQueryString(name) {
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
  var search = window.location.search;

  var r = search.substr(1).match(reg);

  if (r !== null) {
      return unescape(r[2]);
  } else {
      return null;
  }
};

/**
 * 控制遮罩层元素的显示隐藏的方法
 * { element } 需要进行控制显示的tip层，传入
 * { time } 显示tip的时间，默认为1秒
 */
function tipController(element, time) {
  $(element).fadeIn();
  setTimeout(function() {
      $(element).fadeOut();
  }, time || 1000);
}
