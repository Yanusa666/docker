drop schema if exists news cascade;
create schema if not exists news;


create sequence news.news_id_seq;
create table if not exists news.news
(
    id          bigint default nextval('news.news_id_seq') not null,
    title       varchar                                    not null,
    description varchar                                    not null,
    pub_date    timestamptz                                not null,
    link        varchar                                    not null,
    constraint news_pk
        primary key (id),
    constraint news_link_constraint
        unique (link)
);
create index news_link_index on news.news (link);


drop database comments;
create database comments;
-- drop schema if exists comments cascade;
create schema if not exists comments;


create sequence comments.comments_id_seq;
create table if not exists comments.comments
(
    id        bigint default nextval('comments.comments_id_seq') not null,
    new_id    bigint                                             not null,
    parent_id bigint                                             null,
    text      varchar                                            not null,
    pub_date  timestamptz                                        not null,
    constraint comments_pk
        primary key (id),
    constraint comments_new_id_fk
        foreign key (new_id) references news.news,
    constraint comments_parent_id_fk
        foreign key (parent_id) references comments.comments
);