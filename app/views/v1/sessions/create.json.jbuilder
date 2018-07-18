json.user do
    json.call(
    @user,
    :email,
    :authentication_token
    )
end
