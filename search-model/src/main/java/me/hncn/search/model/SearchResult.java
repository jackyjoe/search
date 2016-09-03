package me.hncn.search.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.Map;

/**
 * Created by XMH on 2016/5/21.
 */
@JsonIgnoreProperties(ignoreUnknown=true)
public class SearchResult {
    private String cacheUrl;
    private String clicktrackUrl;
    private String content;
    private String contentNoFormatting;
    private String formattedUrl;
    private Map<String,Object> richSnippet;
    private String title;
    private String titleNoFormatting;
    private String unescapedUrl;
    private String url;
    private String visibleUrl;

    public String getCacheUrl() {
        return cacheUrl;
    }

    public void setCacheUrl(String cacheUrl) {
        this.cacheUrl = cacheUrl;
    }

    public String getClicktrackUrl() {
        return clicktrackUrl;
    }

    public void setClicktrackUrl(String clicktrackUrl) {
        this.clicktrackUrl = clicktrackUrl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContentNoFormatting() {
        return contentNoFormatting;
    }

    public void setContentNoFormatting(String contentNoFormatting) {
        this.contentNoFormatting = contentNoFormatting;
    }

    public String getFormattedUrl() {
        return formattedUrl;
    }

    public void setFormattedUrl(String formattedUrl) {
        this.formattedUrl = formattedUrl;
    }

    public Map<String, Object> getRichSnippet() {
        return richSnippet;
    }

    public void setRichSnippet(Map<String, Object> richSnippet) {
        this.richSnippet = richSnippet;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleNoFormatting() {
        return titleNoFormatting;
    }

    public void setTitleNoFormatting(String titleNoFormatting) {
        this.titleNoFormatting = titleNoFormatting;
    }

    public String getUnescapedUrl() {
        return unescapedUrl;
    }

    public void setUnescapedUrl(String unescapedUrl) {
        this.unescapedUrl = unescapedUrl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getVisibleUrl() {
        return visibleUrl;
    }

    public void setVisibleUrl(String visibleUrl) {
        this.visibleUrl = visibleUrl;
    }
}
