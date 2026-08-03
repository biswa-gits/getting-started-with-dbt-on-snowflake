CREATE USER IF NOT EXISTS github_actions_service_user
  TYPE = SERVICE
  WORKLOAD_IDENTITY = (
    TYPE = OIDC
    ISSUER = 'https://token.actions.githubusercontent.com',
    SUBJECT = 'repo:biswa-gits/snowflake-dbt-Workshop:environment:prod'
  )
  DEFAULT_ROLE = ACCOUNTADMIN
  COMMENT = 'Service user for GitHub Actions';

GRANT ROLE ACCOUNTADMIN TO USER github_actions_service_user;

ALTER USER github_actions_service_user SET DEFAULT_WAREHOUSE = 'TASTY_BYTES_DBT_WH';