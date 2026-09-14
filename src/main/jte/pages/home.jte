@param long postCount

@template.layout.main(
title = "Home",
content = @`
    <p class="mb-6 text-gray-600 dark:text-gray-300">
        A small blog app built with Spring Boot, JTE and TailwindCSS —
        server-rendered, no JavaScript framework.
    </p>

    <p class="mb-8 text-gray-600 dark:text-gray-300">
        @if(postCount == 0)
            There are no posts yet.
        @elseif(postCount == 1)
            There is 1 post.
        @else
            There are ${postCount} posts.
        @endif
    </p>

    <div class="flex gap-3">
        <a href="/posts"
           class="rounded bg-blue-600 px-4 py-2 font-bold text-white transition duration-300 hover:bg-blue-700">
            Browse posts
        </a>
        <a href="/posts/new"
           class="rounded bg-gray-500 px-4 py-2 font-bold text-white transition duration-300 hover:bg-gray-600">
            Write one
        </a>
    </div>
`
)
