%Ueberauth.Auth{credentials: %Ueberauth.Auth.Credentials{expires: false,
  expires_at: nil, other: %{}, refresh_token: nil,
  scopes: ["public_repo", "user"], secret: nil,
  token: "5d57ec0ca10d71f79d0c7192ac57c90d82fc1450", token_type: "Bearer"},
 
 
 extra: %Ueberauth.Auth.Extra{raw_info: %{token: %OAuth2.AccessToken{access_token: "5d57ec0ca10d71f79d0c7192ac57c90d82fc1450",
     client: %OAuth2.Client{authorize_url: "https://github.com/login/oauth/authorize",
      client_id: "dcb9246c79e4751648c2",
      client_secret: "ae05e4fab2f756c845c97797c12252d3c19d0b5c", headers: [],
      params: %{"client_id" => "dcb9246c79e4751648c2",
        "client_secret" => "ae05e4fab2f756c845c97797c12252d3c19d0b5c",
        "code" => "42e129a7ae2eab7a4db6", "grant_type" => "authorization_code",
        "redirect_uri" => ""}, redirect_uri: "", site: "https://api.github.com",
      strategy: Ueberauth.Strategy.Github.OAuth, token_method: :post,
      token_url: "https://github.com/login/oauth/access_token"},
     expires_at: nil, other_params: %{"scope" => "public_repo,user"},
     refresh_token: nil, token_type: "Bearer"},
    user: %{"collaborators" => 0, "company" => nil, "bio" => nil,
      "following" => 6,
      "followers_url" => "https://api.github.com/users/ench0/followers",
      "public_gists" => 0, "id" => 10009972,
      "avatar_url" => "https://avatars.githubusercontent.com/u/10009972?v=3",
      "events_url" => "https://api.github.com/users/ench0/events{/privacy}",
      "starred_url" => "https://api.github.com/users/ench0/starred{/owner}{/repo}",
      "private_gists" => 0, "blog" => nil,
      "subscriptions_url" => "https://api.github.com/users/ench0/subscriptions",
      "type" => "User", "disk_usage" => 871899, "site_admin" => false,
      "owned_private_repos" => 0, "public_repos" => 59, "location" => nil,
      "hireable" => nil, "created_at" => "2014-11-30T14:52:19Z",
      "name" => "Ench0",
      "organizations_url" => "https://api.github.com/users/ench0/orgs",
      "gists_url" => "https://api.github.com/users/ench0/gists{/gist_id}",
      "following_url" => "https://api.github.com/users/ench0/following{/other_user}",
      "url" => "https://api.github.com/users/ench0", "email" => nil,
      "login" => "ench0", "html_url" => "https://github.com/ench0",
      "gravatar_id" => "",
      "received_events_url" => "https://api.github.com/users/ench0/received_events",
      "repos_url" => "https://api.github.com/users/ench0/repos",
      "plan" => %{"collaborators" => 0, "name" => "free", "private_repos" => 0,
        "space" => 976562499}, "followers" => 1,
      "updated_at" => "2016-11-20T20:24:34Z", "total_private_repos" => 0}}},
 
 
 info: %Ueberauth.Auth.Info{description: nil, email: nil, first_name: nil,
  image: nil, last_name: nil, location: nil, name: "Ench0", nickname: "ench0",
  phone: nil,
  urls: %{api_url: "https://api.github.com/users/ench0",
    avatar_url: "https://avatars.githubusercontent.com/u/10009972?v=3",
    blog: nil,
    events_url: "https://api.github.com/users/ench0/events{/privacy}",
    followers_url: "https://api.github.com/users/ench0/followers",
    following_url: "https://api.github.com/users/ench0/following{/other_user}",
    gists_url: "https://api.github.com/users/ench0/gists{/gist_id}",
    html_url: "https://github.com/ench0",
    organizations_url: "https://api.github.com/users/ench0/orgs",
    received_events_url: "https://api.github.com/users/ench0/received_events",
    repos_url: "https://api.github.com/users/ench0/repos",
    starred_url: "https://api.github.com/users/ench0/starred{/owner}{/repo}",
    subscriptions_url: "https://api.github.com/users/ench0/subscriptions"}},


 provider: :github, strategy: Ueberauth.Strategy.Github, uid: "ench0"}
[info] Sent 500 in 1800ms