package me.hncn.search.handle;

import me.hncn.search.model.SearchResult;

import java.util.List;
import java.util.Map;

/**
 * Created by XMH on 2016/5/21.
 */
public interface SearchHandle {
    List<SearchResult> doSearch(Map<String, Object> param, String keyWord, int start, int pageSize);
}
