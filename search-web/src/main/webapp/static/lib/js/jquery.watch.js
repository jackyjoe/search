/**
 * Created by XMH on 2016/5/28.
 *
 * 想着能不能一种简单有用的办法，又解决跨浏览器。想到只监听keyup，和paste事件，
 * 同时过滤掉无效的不改变值的keyup。
 * 怎么判断无效呢？很自然的一个办法就是在dom中缓存原先的值然后做对比。
 * 按照这个思路封装一个jquery的插件，致敬angularjs。
 */
(function($) {
    $.fn.watch = function(callback) {
        return this.each(function() {
            //缓存以前的值
            $.data(this, 'originVal', $(this).val());

            //event
            $(this).on('keyup paste', function() {
                var originVal = $(this, 'originVal');
                var currentVal = $(this).val();

                if (originVal !== currentVal) {
                    $.data(this, 'originVal', $(this).val());
                    callback(currentVal);
                }
            });
        });
    }
})(jQuery);
