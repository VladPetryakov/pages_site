# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

raise 'Database is not empty' if Page.any?

first = Page.create!(name: 'First',
                     title: 'Title',
                     text: %{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa euismod, dictum ligula interdum, malesuada massa. Integer non cursus odio.
                        Vestibulum vulputate imperdiet ligula, id placerat erat aliquet quis.
                        <p>\\\\Химическая <b>Формула\\\\ изумруда:</b>
                        <i>Be<sub>3</sub>Al<sub>2</sub>(SiO<sub>3</sub>)<sub>6</sub></i></p>
                        <p>В тексте есть слово: <mark>удача</mark>.</p>
                        <p>Слово <del>беда</del> было удалено из текста.</p>
                        <p>Слово <ins>победа</ins> было добавлено в текст.</p>
                        <p>Формула воды: Н<sub>2</sub>O.</p>
                        <p>Скорость ветра: 20м<sup>3</sup>/сек.</p>

                        <p>*слово1 \\\\слово2* слово3\\\\</p>
                        <p><b>слово1 \\\\слово2</b> слово3\\\\</p>
                        <p><b>слово1 <i>слово2</b> слово3<\i></p>
                    },
                     path: ['First'])
Page.create!(name: 'Second',
             title: 'Other title',
             text: %(Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa euismod, dictum ligula interdum, malesuada massa. Integer non cursus odio.
                Vestibulum vulputate imperdiet ligula, id placerat erat aliquet quis. Nulla tincidunt, augue sit amet congue dignissim, arcu felis varius dui, eu sagittis turpis nibh at tortor.
                Curabitur porta odio ut congue pellentesque.
             ),
             path: ['Second'])
Page.create!(name: 'Subpage',
             title: 'Subpage title',
             text: %(Curabitur porta odio ut congue pellentesque. Nunc aliquet tellus et odio tincidunt consectetur. Aliquam sollicitudin commodo justo a tincidunt.
                Nam quis lacus eu lacus congue mattis ut a purus. Integer pulvinar, diam consequat maximus hendrerit, lacus ligula porttitor metus, in vehicula ante ex et nibh.
                Morbi vel est hendrerit, tincidunt leo vel, sollicitudin sapien. Nam iaculis vitae eros vel ornare. Nullam lacus erat, iaculis eu lacus a, porta mollis leo. Nulla facilisi.
                Nunc sed finibus ex. Quisque euismod condimentum pretium. Pellentesque rhoncus felis leo, ac aliquam eros ultricies a. Vivamus dictum interdum tortor, sed finibus ligula tincidunt sed.
                Vivamus molestie ac elit eu vulputate. Morbi pellentesque dui eu arcu tincidunt rutrum.
             ),
             parent_id: first.id,
             path: %w[First Subpage])
third = Page.create!(name: 'Third',
                     title: 'Other title',
                     text: %{((First/Subpage *Lorem* \\\\ipsum\\\\)) dolor *sit \\\\amet*, consectetur\\\\ adipiscing ((Third elit)). Etiam ((First nec)) massa euismod, dictum ligula interdum, malesuada massa. Integer non cursus odio.
                Vestibulum vulputate imperdiet ligula, id placerat erat aliquet quis. Nulla tincidunt, augue sit amet congue dignissim, arcu felis varius dui, eu sagittis turpis nibh at tortor.
                Curabitur porta odio ut congue pellentesque. Nunc aliquet tellus et odio tincidunt consectetur. Aliquam sollicitudin commodo justo a tincidunt.
                Nam quis lacus eu lacus congue mattis ut a purus. Integer pulvinar, diam consequat maximus hendrerit, lacus ligula porttitor metus, in vehicula ante ex et nibh.
                Morbi vel est hendrerit, tincidunt leo vel, sollicitudin sapien. Nam iaculis vitae eros vel ornare. Nullam lacus erat, iaculis eu lacus a, porta mollis leo. Nulla facilisi.
                Nunc sed finibus ex. Quisque euismod condimentum pretium. Pellentesque rhoncus felis leo, ac aliquam eros ultricies a. Vivamus dictum interdum tortor, sed finibus ligula tincidunt sed.
                Vivamus molestie ac elit eu vulputate. Morbi pellentesque dui eu arcu tincidunt rutrum.
                Aenean hendrerit, odio nec condimentum molestie, urna nunc finibus tellus, a ultrices nisi tortor a tellus. Duis pellentesque odio tortor, ac facilisis elit blandit in.
                Sed imperdiet pretium arcu, vitae facilisis quam semper at. Nullam libero felis, aliquam pellentesque ante quis, gravida condimentum ex. Donec commodo ultricies quam.
                Vivamus eget consequat eros, quis tincidunt nisl. Aliquam fermentum placerat lectus sit amet sodales. In tincidunt quam sed sagittis vehicula. Nullam tempor at diam eu consectetur.
                Ut vitae quam ut lacus vulputate iaculis in nec nisi. Phasellus ut diam ipsum. Integer pretium sit amet orci at eleifend. Nunc maximus iaculis arcu, nec bibendum dolor pharetra tincidunt.
                Nulla eget pellentesque augue. Donec efficitur risus eget suscipit aliquet. Proin porta dolor sed nulla accumsan, at aliquam libero maximus.
                Pellentesque massa ex, dictum at ligula ut, dictum gravida lacus. Suspendisse volutpat, libero sed lobortis tincidunt, odio nunc pellentesque odio, vel blandit leo velit eget urna.
                Nunc semper pellentesque vehicula. Nunc cursus varius rutrum. Fusce ullamcorper mollis dictum. Quisque accumsan turpis non lorem semper, in tincidunt odio fringilla.
                Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam rhoncus nunc non neque tincidunt molestie.
                Nam ultrices, orci eget convallis feugiat, risus leo aliquam turpis, in fermentum odio risus sed lectus. Quisque sed tortor id justo tincidunt congue quis at ante.
                Nullam vitae tortor elit. Donec a egestas ipsum, ac iaculis ex. Proin convallis pulvinar enim rhoncus maximus. Phasellus in tellus id magna tincidunt dictum.
                Aliquam lacus risus, semper eu velit quis, placerat volutpat risus. Proin dapibus pretium fringilla. Nulla hendrerit tincidunt velit, at condimentum est fermentum a.
                Nam nulla turpis, accumsan eu pharetra ullamcorper, sodales non leo. Phasellus eu sollicitudin dolor. Suspendisse interdum lacinia tellus quis blandit.
                Nam eleifend, tortor a vehicula luctus, nibh ipsum fringilla augue, vel finibus enim risus eget ex.
             },
                     path: ['Third'])
subpage1 = Page.create!(name: 'Subpage',
                        title: 'Other title',
                        text: %(Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec massa euismod, dictum ligula interdum, malesuada massa. Integer non cursus odio.
                Vestibulum vulputate imperdiet ligula, id placerat erat aliquet quis. Nulla tincidunt, augue sit amet congue dignissim, arcu felis varius dui, eu sagittis turpis nibh at tortor.
                Curabitur porta odio ut congue pellentesque. Nunc aliquet tellus et odio tincidunt consectetur. Aliquam sollicitudin commodo justo a tincidunt.
                Nam quis lacus eu lacus congue mattis ut a purus. Integer pulvinar, diam consequat maximus hendrerit, lacus ligula porttitor metus, in vehicula ante ex et nibh.
                Morbi vel est hendrerit, tincidunt leo vel, sollicitudin sapien. Nam iaculis vitae eros vel ornare. Nullam lacus erat, iaculis eu lacus a, porta mollis leo. Nulla facilisi.
                Nunc sed finibus ex. Quisque euismod condimentum pretium. Pellentesque rhoncus felis leo, ac aliquam eros ultricies a. Vivamus dictum interdum tortor, sed finibus ligula tincidunt sed.
                Vivamus molestie ac elit eu vulputate. Morbi pellentesque dui eu arcu tincidunt rutrum.
             ),
                        parent_id: third.id,
                        path: %w[Third Subpage])
subsubpage = Page.create!(name: 'Subsubpage',
                          title: 'Other title',
                          text: %(Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam rhoncus nunc non neque tincidunt molestie.
                Nam ultrices, orci eget convallis feugiat, risus leo aliquam turpis, in fermentum odio risus sed lectus. Quisque sed tortor id justo tincidunt congue quis at ante.
                Nullam vitae tortor elit. Donec a egestas ipsum, ac iaculis ex. Proin convallis pulvinar enim rhoncus maximus. Phasellus in tellus id magna tincidunt dictum.
                Aliquam lacus risus, semper eu velit quis, placerat volutpat risus. Proin dapibus pretium fringilla. Nulla hendrerit tincidunt velit, at condimentum est fermentum a.
                Nam nulla turpis, accumsan eu pharetra ullamcorper, sodales non leo. Phasellus eu sollicitudin dolor. Suspendisse interdum lacinia tellus quis blandit.
                Nam eleifend, tortor a vehicula luctus, nibh ipsum fringilla augue, vel finibus enim risus eget ex.
             ),
                          parent_id: subpage1.id,
                          path: %w[Third Subpage Subsubpage])
