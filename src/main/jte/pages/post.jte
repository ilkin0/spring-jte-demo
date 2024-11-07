@import com.ilkinmehdiyev.springjteblogapp.Post
@param Post post

@template.layout.main(
title = post.getTitle(),
content = @`
    <article class="bg-white dark:bg-gray-800 shadow-md rounded-lg overflow-hidden">
        <div class="p-6">
            <div class="flex justify-between items-center text-sm text-gray-500 dark:text-gray-400 mb-6">
                <span>By ${post.getAuthor()}</span>
                <span>Posted on ${post.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("MMMM d, yyyy 'at' h:mm a"))}</span>
            </div>
            <div class="prose dark:prose-invert max-w-none">
                ${post.getContent()}
            </div>
        </div>
    </article>

    <div class="mt-8 flex justify-between">
        <a href="/posts" class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded transition duration-300 ease-in-out">
            Back to Posts
        </a>
        <div>
            <a href="/posts/${post.getId()}/edit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded transition duration-300 ease-in-out mr-2">
                Edit Post
            </a>
            <form action="/posts/${post.getId()}/delete" method="POST" class="inline">
                <button type="submit" class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded transition duration-300 ease-in-out" onclick="return confirm('Are you sure you want to delete this post?')">
                    Delete Post
                </button>
            </form>
        </div>
    </div>
`
)

