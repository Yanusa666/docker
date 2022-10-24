drop schema if exists comments cascade;
create schema if not exists comments;


create sequence comments.comments_id_seq;
create table if not exists comments.comments
(
    id        bigint      default nextval('comments.comments_id_seq') not null,
    new_id    bigint                                                  not null,
    parent_id bigint                                                  null,
    text      varchar                                                 not null,
    pub_date  timestamptz default now()                               not null,
    constraint comments_pk
        primary key (id),
    constraint comments_parent_id_fk
        foreign key (parent_id) references comments.comments
);