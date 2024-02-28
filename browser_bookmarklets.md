# Jira — copy to clipboard issue's data (title,url)  
bookmarklets for one-click copying issue's data  
```
JP-321 to do the greatest thing ever !%& ||| https://yourdomain.atlassian.net/browse/JP-321
JP-321 to do the greatest thing ever !%&
JP-321_to_do_the_greatest_thing_ever____
```  
  
## {key} {title} ||| {url}  
copy to clipboard string:  
```
JP-321 to do the greatest thing ever !%& ||| https://yourdomain.atlassian.net/browse/JP-321
```  
code:  
``` JS
javascript: (() => {
    jira_issue_key = document.querySelector("[data-testid='issue.views.issue-base.foundation.breadcrumbs.current-issue.item']").textContent;
    jira_issue_title = document.querySelector("[data-testid='issue.views.issue-base.foundation.summary.heading']").textContent;
    jira_issue_url = document.querySelector("[data-testid='issue.views.issue-base.foundation.breadcrumbs.current-issue.item']").href;
    result_string = jira_issue_key + ' ' + jira_issue_title + ' ||| ' + jira_issue_url;
    navigator.clipboard.writeText(result_string);
    history.replaceState({}, "", location.href);
})();
```  
  
## {key} {title}  
copy to clipboard string:  
```
JP-321 to do the greatest thing ever !%&
```  
code:    
``` JS
javascript: (() => {
    jira_issue_key = document.querySelector("[data-testid='issue.views.issue-base.foundation.breadcrumbs.current-issue.item']").textContent;
    jira_issue_title = document.querySelector("[data-testid='issue.views.issue-base.foundation.summary.heading']").textContent;
    result_string = jira_issue_key + ' ' + jira_issue_title;
    navigator.clipboard.writeText(result_string);
    history.replaceState({}, "", location.href);
})();
```  
  
## {key} {title} formatted for git  
keep only letters,numbers and hyphen (-), replace other with underscore (_)  
https://docs.github.com/en/get-started/using-git/dealing-with-special-characters-in-branch-and-tag-names#naming-branches-and-tags  
copy to clipboard string: 
```
JP-321_to_do_the_greatest_thing_ever____
```
  
code:  
``` JS
javascript: (() => {
    jira_issue_key = document.querySelector("[data-testid='issue.views.issue-base.foundation.breadcrumbs.current-issue.item']").textContent;
    jira_issue_title = document.querySelector("[data-testid='issue.views.issue-base.foundation.summary.heading']").textContent;
    result_string = jira_issue_key + ' ' + jira_issue_title;
    result_string = result_string.replace(/[^a-zA-Z0-9-]/g, '_');
    navigator.clipboard.writeText(result_string);
    history.replaceState({}, "", location.href);
})();
```
