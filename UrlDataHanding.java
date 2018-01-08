package cn.zx.ghjmaven.action.data;

import cn.zx.ghjmaven.action.bc.DownloadPage;

public class UrlDataHanding implements Runnable {
    /**
     * 下载对应页面并分析出页面对应的URL放在未访问队列中。
     *
     * @param url
     */
    public void dataHanding(String url) {
        HrefOfPage.getHrefOfContent(DownloadPage.getContentFormUrl(url));
    }

    public void run() {
        while (!UrlQueue.isEmpty()) {
            dataHanding(UrlQueue.outElem());
        }
    }
}