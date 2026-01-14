# Protos (canonical)

This repo contains canonical .proto files for all services.

## Layout
- proto/
    - product-service/
        - category/v1/*.proto
        - collection/v1/*.proto
        - digital/v1/*.proto
        - image/v1/*.proto
        - lesson/
            - v1/*.proto
            - lesson_video_version/v1/*.proto
        - physical/v1/*.proto
        - product/
            - v1/*.proto
            - product_image/v1/*.proto
        - seminar/v1/*.proto
        - training/v1/*.proto
        - variant/
            - v1/*.proto
            - variant_price/v1/*.proto
        - video/v1/*.proto

### Developer workflow
- Edit protos under proto/ and open PRs.
- Run locally:
    - `buf lint`
- For clients, publish a descriptor on buf.build or consumers use buf.generate to fetch specific versions.

### Best practices
- Use explicit `package` and `option go_package` in every .proto.
- Keep shared messages in `proto/common/v1`.
- Version APIs with v1/v2 directories and package names.