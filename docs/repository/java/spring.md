* zuul修改请求头部
```
@Override
public Object run() {
	RequestContext ctx = RequestContext.getCurrentContext();
	ctx.addZuulRequestHeader("permission", "addXXX");
```

* zuul修改请求响应body
```
public Object run() {
    try {
        RequestContext context = getCurrentContext();
        InputStream stream = context.getResponseDataStream();
        String body = StreamUtils.copyToString(stream, Charset.forName("UTF-8"));
        context.setResponseBody("new body: "+body);
    }
    catch (IOException e) {
        rethrowRuntimeException(e);
    }
    return null;
}
```


