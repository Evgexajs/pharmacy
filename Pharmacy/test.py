class Component:
    def __init__(self, name, value, queryset):
        self.queryset = queryset
        self.name = name
        self.value = value

    def set_object(self, obj):
        self.object = obj

    def find_closest_component(self, amount):
        closest_component = self.queryset.annotate(
            min_price=Least('price_dns', 'price_citilink', 'price_regard')
        ).filter(
            min_price__lte= self.value * amount
        ).order_by('-min_price').first()
        self.result = closest_component

class Components:
    def __init__(self, amount):
        self.amount = amount
        self.step = 0.01
        self.socket = None
        self.drone = None
        self.video_card = None
        self.cpu = None
        self.motherboard = None
        self.computer_case = None
        self.ram = None
        self.ssd = None
        self.psu = None

    def find_max(self):
        max = 0
        component_name = None
        if self.video_card != None and self.video_card.value > max:
            max = self.video_card.value
            component = 'video_card'
        elif self.cpu != None and self.cpu.value > max:
            max = self.cpu.value
            component = 'cpu'
        elif self.motherboard != None and self.motherboard.value > max:
            max = self.motherboard.value
            component = 'motherboard'
        elif self.computer_case != None and self.computer_case.value > max:
            max = self.computer_case.value
            component = 'computer_case'
        elif self.ram != None and self.ram.value > max:
            max = self.ram.value
            component = 'ram'
        elif self.ssd != None and self.ssd.value > max:
            max = self.ssd.value
            component = 'ssd'
        elif self.psu != None and self.psu.value > max:
            max = self.psu.value
            component = 'psu'
        else:
            # ошибка что-то тут не чисто
            pass
            return
        return component

    def set_component(self, component):
        comp = component
        comp.find_closest_component(self.amount)
        if comp.result is None:
            while comp.result is None:
                max_component_name = self.find_max()
                print(max_component_name)
                item = getattr(self, max_component_name)
                item.value -= self.step
                item.find_closest_component(self.amount)
                setattr(self, max_component_name, item)
                comp.value += self.step
                comp.find_closest_component(self.amount)
                
        item = getattr(self, comp.name)
        item = comp
        item.set_object(comp.result)
        setattr(self, comp.name, item)

def setup(request):
    if request.method == 'GET':
        amount = float(request.GET.get('amount'))
        drone = request.GET.get('drone')

        components = Components(amount)
        
        video_card = Component('video_card', 0.3, VideoCard.objects)
        cpu = Component('cpu', 0.25, Processor.objects.objects.filter(title__icontains=drone))
        motherboard = Component('motherboard', 0.15, Motherboard.objects.filter(details__icontains=modified_socket))
        computer_case = Component('computer_case', 0.05, ComputerCase.objects)
        ram = Component('ram', 0.1, RAM.objects)
        ssd = Component('ssd', 0.1, SSD.objects)
        psu = Component('psu', 0.05, PSU.objects)

        components.set_component(video_card)
        components.set_component(cpu)
        components.set_component(motherboard)
        components.set_component(computer_case)
        components.set_component(ram)
        components.set_component(ssd)
        components.set_component(psu)

        print(components)

        tolerance = 0.01  # Допустимая погрешность в процентном отношении

        optimal_values = [
            0.3, 0.25, 0.15, 0.05, 0.1, 0.1, 0.05
        ]
        # optimal_videocard = 0.3
        # optimal_cpu = 0.25
        # optimal_mobo = 0.15
        # optimal_cases = 0.05
        # optimal_ram = 0.1
        # optimal_ssd = 0.1
        # optimal_psu = 0.05

        def find_closest_component(queryset, index):
            closest_component = queryset.annotate(
                min_price=Least('price_dns', 'price_citilink', 'price_regard')
            ).filter(
                min_price__lte=optimal_values[index] * amount
            ).order_by('-min_price').first()

            if closest_component is None:
                # если max_index === index то будет ошибка нужно обработать
                optimal_values[index] += tolerance
                max_index = optimal_values.index(max(optimal_values))
                optimal_values[max_index] -= tolerance

                closest_component = find_closest_component(queryset, index)
                return {
                    'state': max_index,
                    'result': closest_component
                }

            return {
                'state': True,
                'result': closest_component
            }

     
        def recursive_search(arr, results, truth):
            if truth >= 6:
                return results

            for index in range(7):
                result = find_closest_component(arr[index], index)
                if result['state'] == index:
                    truth += 1
                    results[index] = result['result']
                else:
                    truth -= 1
                    res = recursive_search(arr[result['state']], results, truth)
                    results[result['state']] = res[result['state']]

            return results

        arr = [VideoCard.objects, Processor.objects.filter(title__icontains=drone), Motherboard.objects.filter(details__icontains=modified_socket), ComputerCase.objects, RAM.objects, SSD.objects, PSU.objects]
        results = [None, None, None, None, None, None, None]
        truth = 0

        final_results = recursive_search(arr, results, truth)

        print(final_results)
        # video_card = find_closest_component(VideoCard.objects, 0)

        # cpu = find_closest_component(
        #     Processor.objects.filter(title__icontains=drone),
        #     1
        # )

        # cpu_socket = cpu.details.split(',')[0].strip()
        # modified_socket = cpu_socket.replace("LGA ", "").strip().replace("сокет", "Socket")
        # print(modified_socket)
        # print(Motherboard.objects.filter(details__icontains=modified_socket))
        # motherboard = find_closest_component(
        #     Motherboard.objects.filter(details__icontains=modified_socket),
        #     2
        # )

        # computer_case = find_closest_component(
        #     ComputerCase.objects,
        #     3
        # )

        # ram = find_closest_component(
        #     RAM.objects,
        #     4
        # )

        # ssd = find_closest_component(
        #     SSD.objects,
        #     5
        # )

        # psu = find_closest_component(
        #     PSU.objects,
        #     6
        # )

        return render(request, 'AppPC/setup.html', {
            'total_sum': video_card.min_price + cpu.min_price + motherboard.min_price + computer_case.min_price + ram.min_price + ssd.min_price + psu.min_price,
            'video_card': video_card,
            'cpu': cpu,
            'motherboard': motherboard,
            'computer_case': computer_case,
            'ram': ram,
            'ssd': ssd,
            'psu': psu,
        })