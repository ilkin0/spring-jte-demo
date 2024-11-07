@import  com.ilkinmehdiyev.springjteblogapp.Post
@param java.util.List<Post> posts

@template.layout.main(
title = "All Posts",
content = @`
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @for(Post post : posts)
            <div class="bg-white dark:bg-gray-800 shadow-md rounded-lg overflow-hidden transition duration-300 ease-in-out transform hover:-translate-y-1 hover:shadow-lg">
                <div class="p-6">
                    <h2 class="text-xl font-semibold mb-2 text-gray-800 dark:text-white">
                        <a href="/posts/${post.getId()}"
                           class="hover:text-blue-500 dark:hover:text-blue-400">${post.getTitle()}</a>
                    </h2>
                    <p class="text-gray-600 dark:text-gray-300 text-sm mb-4">${post.getSummary()}</p>
                    <div class="flex justify-between items-center text-sm text-gray-500 dark:text-gray-400">
                        <span>By ${post.getAuthor()}</span>
                        <span>${post.getCreatedAt().format(java.time.format.DateTimeFormatter.ofPattern("MMM d, yyyy"))}</span>
                    </div>
                </div>
            </div>
        @endfor
    </div>

    @if(posts.isEmpty())
        <p class="text-center text-gray-600 dark:text-gray-400 mt-8">No posts found. Be the first to create a post!</p>
    @endif

    <div class="mt-8 text-center">
        <a href="/posts/new"
           class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded transition duration-300 ease-in-out">
            Create New Post
        </a>
    </div>
`
)