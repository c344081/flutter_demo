import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'repo.g.dart';

@JsonSerializable()
class Repo {
    Repo();

    num id;
    String node_id;
    String name;
    String full_name;
    bool private;
    User owner;
    Repo parent;
    String html_url;
    String description;
    bool fork;
    String url;
    String forks_url;
    String keys_url;
    String collaborators_url;
    String teams_url;
    String hooks_url;
    String issue_events_url;
    String events_url;
    String assignees_url;
    String branches_url;
    String tags_url;
    String blobs_url;
    String git_tags_url;
    String git_refs_url;
    String trees_url;
    String statuses_url;
    String languages_url;
    String stargazers_url;
    String contributors_url;
    String subscribers_url;
    String subscription_url;
    String commits_url;
    String git_commits_url;
    String comments_url;
    String issue_comment_url;
    String contents_url;
    String compare_url;
    String merges_url;
    String archive_url;
    String downloads_url;
    String issues_url;
    String pulls_url;
    String milestones_url;
    String notifications_url;
    String labels_url;
    String releases_url;
    String deployments_url;
    String created_at;
    String updated_at;
    String pushed_at;
    String git_url;
    String ssh_url;
    String clone_url;
    String svn_url;
    String homepage;
    num size;
    num stargazers_count;
    num watchers_count;
    String language;
    bool has_issues;
    bool has_projects;
    bool has_downloads;
    bool has_wiki;
    bool has_pages;
    num forks_count;
    String mirror_url;
    bool archived;
    bool disabled;
    num open_issues_count;
    Map<String,dynamic> license;
    num forks;
    num open_issues;
    num watchers;
    String default_branch;
    
    factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);
    Map<String, dynamic> toJson() => _$RepoToJson(this);
}